// URL에서 proSeq 추출
const urlParams = new URLSearchParams(window.location.search);
const proSeq = urlParams.get("proSeq"); // 예: ?proSeq=230

// 서버에서 데이터 가져오기
fetch('/hotdeal/chart?proSeq=' + proSeq, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' }
})
    .then(response => response.json())
    .then(data => {

        // 날짜 변환 함수
        const parseDate = d3.timeParse("%Y-%m-%d %H:%M:%S"); // 정밀한 시간 변환 지원
        const formatDate = d3.timeFormat("%Y-%m-%d");         // 원하는 형식 변환

        // 데이터 전처리: regitDate를 파싱하고 자정 기준(normalizedDate)으로 정규화
        data.forEach(d => {
            if (d.regitDate) {
                // ".0" 제거 (예: "2025-02-06 00:24:49.0" → "2025-02-06 00:24:49")
                d.regitDate = d.regitDate.split(".")[0];

                // 문자열 → Date 객체 변환
                d.date = parseDate(d.regitDate);

                if (d.date) {
                    // 날짜를 자정 기준으로 정규화 (시간 정보를 제거)
                    d.normalizedDate = new Date(
                        d.date.getFullYear(),
                        d.date.getMonth(),
                        d.date.getDate()
                    );
                } else {
                    console.warn("Invalid date:", d.regitDate);
                }
            }
        });

        // updateChart 함수에 data와 formatDate 함수를 전달합니다.
        updateChart(data, formatDate);
    });


// updateChart 함수: 정규화된 날짜(d.normalizedDate)를 기준으로 x축과 점의 위치를 결정
function updateChart(data, formatDate) {
    // 기존 SVG 내용 제거
    d3.select("#svg-chart").selectAll("*").remove();

    // SVG 크기 및 여백 설정
    const margin = { top: 20, right: 30, bottom: 40, left: 50 };
    const width = 800 - margin.left - margin.right;
    const height = 400 - margin.top - margin.bottom;

    // 고유한 날짜(문자열 형식) 추출 → 이를 Date 객체(자정 기준)로 변환
    const uniqueNormalizedDates = [...new Set(data.map(d => d.normalizedDate.getTime()))]
        .map(t => new Date(t));

    // x축: 정규화된 날짜를 기준으로 도메인 설정
    const x = d3.scaleTime()
        .domain(d3.extent(data, d => d.normalizedDate)) // 최소 ~ 최대 정규화 날짜
        .range([0, width]);

    // y축: lowPrice 값을 기준으로 도메인 설정
    const y = d3.scaleLinear()
        .domain([
            Math.max(50, d3.min(data, d => d.lowPrice) * 0.9),
            d3.max(data, d => d.lowPrice) * 1.1
        ])
        .range([height, 0]);

    // SVG 요소 생성
    const svg = d3.select("#svg-chart")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", `translate(${margin.left},${margin.top})`);

    // x축 생성: 눈금은 고유 날짜(Date 객체 배열)를 사용하고, 라벨은 YYYY-MM-DD 형식으로 표시
    const xAxis = d3.axisBottom(x)
        .tickValues(uniqueNormalizedDates)
        .tickFormat(d3.timeFormat("%Y-%m-%d"));

    const yAxis = d3.axisLeft(y);

    // 축 추가
    svg.append("g")
        .attr("transform", `translate(0, ${height})`)
        .call(xAxis);
    svg.append("g")
        .call(yAxis);

    // 선(Line) 생성: x좌표는 정규화된 날짜를 사용
    const line = d3.line()
        .x(d => x(d.normalizedDate))
        .y(d => y(d.lowPrice));

    // 선 추가
    svg.append("path")
        .datum(data)
        .attr("fill", "none")
        .attr("stroke", "steelblue")
        .attr("stroke-width", 2)
        .attr("d", line);

    // 데이터 포인트(원) 추가: x좌표는 정규화된 날짜 사용
    svg.selectAll("circle")
        .data(data)
        .enter()
        .append("circle")
        .attr("cx", d => x(d.normalizedDate))
        .attr("cy", d => y(d.lowPrice))
        .attr("r", 4)
        .attr("fill", "steelblue");
}

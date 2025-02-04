const urlParams = new URLSearchParams(window.location.search);
const proSeq = urlParams.get("proSeq"); // "230" (예제: ?proSeq=230)
console.log("proSeq 값:", proSeq);

// 서버에서 데이터 가져오는 함수
fetch('/hotdeal/chart?proSeq=' + proSeq, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' }
})
    .then(response => response.json())
    .then(data => {
        console.log("서버에서 받은 데이터:", data);

        // 날짜 데이터 변환
        const parseDate = d3.timeParse("%Y-%m-%d %H:%M:%S"); // ✅ 정밀한 시간 변환 지원
        const formatDate = d3.timeFormat("%Y-%m-%d %H:%M"); // ✅ 원하는 형식 변환

        data.forEach(d => {
            console.log("Before Fixing:", d.regitDate);

            if (d.regitDate) {
                d.regitDate = d.regitDate.split(".")[0]; // ✅ ".0" 제거
                d.date = parseDate(d.regitDate); // ✅ Date 변환

                if (d.date) {
                    d.date.setHours(d.date.getHours() + 9); // ✅ KST 변환
                    d.formattedDate = formatDate(d.date); // ✅ YYYY-MM-DD HH:mm 포맷 적용
                } else {
                    console.warn("Invalid date:", d.regitDate);
                }
            }
        });

        console.log("Formatted Data:", data);

        updateChart(data, formatDate); // ✅ formatDate를 updateChart()에 전달
    });

function updateChart(data, formatDate) { // ✅ formatDate를 인자로 받음
    d3.select("#svg-chart").selectAll("*").remove();

    console.log("Loaded data:", data);
    // SVG dimensions and margins
    const margin = {top: 20, right: 30, bottom: 40, left: 50};
    const width = 800 - margin.left - margin.right;
    const height = 400 - margin.top - margin.bottom;

    // X축 (시간 축) 및 Y축 (가격 축) 설정
    const x = d3.scaleTime()
        .domain(d3.extent(data, d => d.date)) // `date` 사용
        .range([0, width]);

    const y = d3.scaleLinear()
        .domain([0, d3.max(data, d => d.lowPrice)])
        .nice()
        .range([height, 0]);

    // Create SVG element
    const svg = d3.select("#svg-chart")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", `translate(${margin.left},${margin.top})`);

    // 중복 없는 날짜 생성
    const uniqueDates = [...new Set(data.map(d => d.formattedDate))];
    console.log("Unique Dates for X-Axis:", uniqueDates);

    const xAxis = d3.axisBottom(x)
        .tickValues(data.map(d => d.date)) // `date` 사용
        .tickFormat(d => formatDate(d)); // ✅ formatDate를 정상적으로 사용 가능

    const yAxis = d3.axisLeft(y);

    // Add axes to the SVG
    svg.append("g")
        .attr("transform", `translate(0,${height})`)
        .call(xAxis);

    svg.append("g")
        .call(yAxis);

    // Line generator
    const line = d3.line()
        .x(d => x(d.date)) // `date` 사용
        .y(d => y(d.lowPrice));

    // Append the line
    svg.append("path")
        .datum(data)
        .attr("fill", "none")
        .attr("stroke", "steelblue")
        .attr("stroke-width", 2)
        .attr("d", line);

    // Add points
    svg.selectAll("circle")
        .data(data)
        .enter()
        .append("circle")
        .attr("cx", d => x(d.date)) // `date` 사용
        .attr("cy", d => y(d.lowPrice))
        .attr("r", 4)
        .attr("fill", "steelblue");
}

console.log("hello");

// Dummy data
const data = [
    { date: "2025-01-20", price: 100 },
    { date: "2025-01-21", price: 120 },
    { date: "2025-01-22", price: 140 },
    { date: "2025-01-23", price: 90 },
    { date: "2025-01-24", price: 110 },
];

console.log("Loaded data:", data);
// SVG dimensions and margins
const margin = { top: 20, right: 30, bottom: 40, left: 50 };
const width = 800 - margin.left - margin.right;
const height = 400 - margin.top - margin.bottom;

// Parse date
const parseDate = d3.timeParse("%Y-%m-%d");
data.forEach(d => d.date = parseDate(d.date));

// Scales
const x = d3.scaleTime()
    .domain(d3.extent(data, d => d.date))
    .range([0, width]);

const y = d3.scaleLinear()
    .domain([0, d3.max(data, d => d.price)])
    .nice()
    .range([height, 0]);

// Create SVG element
const svg = d3.select("#svg-chart")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", `translate(${margin.left},${margin.top})`);

const uniqueDates = [...new Set(data.map(d => d.date))]; // 중복 제거
console.log("Unique Dates for X-Axis:", uniqueDates);

const xAxis = d3.axisBottom(x)
    .tickValues(uniqueDates) // 중복 없는 고유 날짜 설정
    .tickFormat(d3.timeFormat("%b %d")); // 날짜 포맷 설정

const yAxis = d3.axisLeft(y);

// Add axes to the SVG
svg.append("g")
    .attr("transform", `translate(0,${height})`)
    .call(xAxis);

svg.append("g")
    .call(yAxis);

// Line generator
const line = d3.line()
    .x(d => x(d.date))
    .y(d => y(d.price));

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
    .attr("cx", d => x(d.date))
    .attr("cy", d => y(d.price))
    .attr("r", 4)
    .attr("fill", "steelblue");

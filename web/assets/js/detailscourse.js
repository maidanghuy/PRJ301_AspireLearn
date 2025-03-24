/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//Lich Hoc
const monthYear = document.getElementById("monthYear");
const calendarDays = document.getElementById("calendarDays");
const prevMonth = document.getElementById("prevMonth");
const nextMonth = document.getElementById("nextMonth");

let date = new Date();

function renderCalendar() {
  calendarDays.innerHTML = "";
  const year = date.getFullYear();
  const month = date.getMonth();
  const firstDay = new Date(year, month, 1).getDay();
  const lastDate = new Date(year, month + 1, 0).getDate();
  const prevLastDate = new Date(year, month, 0).getDate();
  monthYear.textContent = date.toLocaleString("default", {
    month: "long",
    year: "numeric",
  });

  // Thêm ngày của tháng trước
  for (let i = firstDay; i > 0; i--) {
    const dayElement = document.createElement("div");
    dayElement.classList.add("day", "inactive");
    dayElement.textContent = prevLastDate - i + 1;
    calendarDays.appendChild(dayElement);
  }

  // Thêm ngày của tháng hiện tại
  for (let day = 1; day <= lastDate; day++) {
    const dayElement = document.createElement("div");
    dayElement.classList.add("day");
    dayElement.textContent = day;

    const today = new Date();
    if (
      day === today.getDate() &&
      month === today.getMonth() &&
      year === today.getFullYear()
    ) {
      dayElement.classList.add("today");
    }

    // Lấy thứ của ngày hiện tại
    let dayOfWeek = new Date(year, month, day).getDay();

    // Chỉ thêm gạch chân nếu là thứ 3 (2), thứ 5 (4), thứ 7 (6) & không phải today
    if (
      !dayElement.classList.contains("today") &&
      (dayOfWeek === 2 || dayOfWeek === 4 || dayOfWeek === 6)
    ) {
      dayElement.classList.add("underline");
    }

    calendarDays.appendChild(dayElement);
  }

  // Thêm ngày của tháng sau để đủ hàng
  const remainingDays = 42 - calendarDays.childElementCount;
  for (let i = 1; i <= remainingDays; i++) {
    const dayElement = document.createElement("div");
    dayElement.classList.add("day", "inactive");
    dayElement.textContent = i;
    calendarDays.appendChild(dayElement);
  }
}

prevMonth.addEventListener("click", () => {
  date.setMonth(date.getMonth() - 1);
  renderCalendar();
});

nextMonth.addEventListener("click", () => {
  date.setMonth(date.getMonth() + 1);
  renderCalendar();
});

renderCalendar();

// Lo trinh hoc tap
document.querySelectorAll(".accordion-header").forEach((header) => {
  header.addEventListener("click", () => {
    document
      .querySelectorAll(".accordion-header")
      .forEach((h) => h.classList.remove("active"));
    document
      .querySelectorAll(".accordion-content")
      .forEach((c) => (c.style.display = "none"));
    header.classList.add("active");
    const content = header.nextElementSibling;
    if (content) content.style.display = "block";
  });
});

// An hien cac the
document.addEventListener("DOMContentLoaded", function () {
  const tabs = document.querySelectorAll(".course__tab");
  const sections = {
    "Thông tin khóa học": document.querySelector(".course__details"),
    "Lịch học": document.querySelector(".calendar"),
    "Lộ trình học tập": document.querySelector(".accordion"),
    "Cam kết sau khóa học": document.querySelector(".commit"),
  };

  // Ẩn tất cả section trừ mặc định
  function hideAllSections() {
    Object.values(sections).forEach((section) =>
      section.classList.add("hidden")
    );
  }

  // Xử lý sự kiện khi nhấn vào tab
  tabs.forEach((tab) => {
    tab.addEventListener("click", function () {
      // Xóa class active khỏi tất cả tabs
      tabs.forEach((t) => t.classList.remove("course__tab--active"));
      // Thêm class active vào tab hiện tại
      tab.classList.add("course__tab--active");

      // Ẩn tất cả nội dung
      hideAllSections();

      // Hiển thị nội dung tương ứng với tab đang nhấn
      const tabText = tab.innerText.trim();
      if (sections[tabText]) {
        sections[tabText].classList.remove("hidden");
      }
    });
  });

  // Mặc định hiển thị phần "Thông tin khóa học"
  hideAllSections();
  sections["Thông tin khóa học"].classList.remove("hidden");
});


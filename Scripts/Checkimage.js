function validateImage() {
    //// Lấy giá trị của trường input file
    var fileInput = document.getElementById("fileInput");
    var file = fileInput.files[0];
    // Kiểm tra nếu trường input file không rỗng
    if (file) {
        // Kiểm tra định dạng của hình ảnh
        if (file.type !== "image/jpeg" && file.type !== "image/png") {
            alert("Hình ảnh không hợp lệ. Chỉ chấp nhận định dạng JPEG hoặc PNG.");
            // Xóa giá trị của trường input file
            fileInput.value = "";
        }
    }

    var fileInput = document.getElementById("fileInput1");
    var file = fileInput.files[1];
    if (file) {
        if (file.type !== "image/jpeg" && file.type !== "image/png") {
            alert("Hình ảnh không hợp lệ. Chỉ chấp nhận định dạng JPEG hoặc PNG.");
            fileInput.value = "";
        }
    }

    var fileInput = document.getElementById("fileInput2");
    var file = fileInput.files[2];
    if (file) {
        if (file.type !== "image/jpeg" && file.type !== "image/png") {
            alert("Hình ảnh không hợp lệ. Chỉ chấp nhận định dạng JPEG hoặc PNG.");
            fileInput.value = "";
        }
    }

    var fileInput = document.getElementById("fileInput3");
    var file = fileInput.files[3];
    if (file) {
        if (file.type !== "image/jpeg" && file.type !== "image/png") {
            alert("Hình ảnh không hợp lệ. Chỉ chấp nhận định dạng JPEG hoặc PNG.");
            fileInput.value = "";
        }
    }
}
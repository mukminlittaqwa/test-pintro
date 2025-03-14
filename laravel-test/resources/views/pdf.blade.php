<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kartu Pelajar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
      body {
         margin : 0;
         padding : 0;
      }
        .circle-placeholder {
            width: 20px; 
            height: 110px;
            border-radius: 100%;
            background-color: #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: #666;
            border: 3px solid #aaa;
        }
        .green-container {
            background-color: #28a745;
            color: #fff;
            width: 120%;
            height: 50px;
            align-items: center;
            margin-top: 1px;
        }
        .green-container1 {
            position:relative;
            background-color: #28a745;
            color: #fff;
            width: 120%;
            flex: flex;
            height: 30px;
            align-items: center;
            margin-top: 150%;
        }

        .page-break {
            page-break-after: always;
        }

        .fonts {
         font-size: 14px;
        }

    </style>
</head>
<body>
    <div class="container text-center">
        <div class="row">
            <h5 class="fs-6">SMA Budi Mulya</h5>
            <div class="circle-placeholder">Foto</div>
            <h6 class="fonts">Nama: Tubagus</h6>
            <h6 class="fonts">NIS: 07238464</h6>
        </div>
    </div>
    <footer>
<div class="green-container">
            <div class="row w-100">
                <div class="col-2 text-center">A</div>
                <div class="col-2 text-center">B</div>
            </div>
        </div>
</footer>

<div class="page-break"></div>

<footer>
<div class="green-container1">
            <p>www.school.com</p>
        </div>
</footer>

</body>
</html>

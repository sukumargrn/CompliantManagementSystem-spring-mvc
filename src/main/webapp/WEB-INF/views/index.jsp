<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>compliant management
 </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
  body {
    background-color: #f8f9fa;
  }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    <div class="container-fluid">
  <header class="bg-light py-3">
    <div class="row">
      <div class="col-md-6">
        <h1 class="h3">Compliance Management System</h1>
      </div>
      <div class="col-md-6 text-end">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    User
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="SignInPage">Sign In</a></li>
                    <li><a class="dropdown-item" href="SignUpPage">Sign Up</a></li>
                  </ul>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Admin
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Admin Login</a></li>
                    <li><a class="dropdown-item" href="#">Department</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
  </header>
  <main class="py-4">
    <div class="row">
      <div class="col-md-4">
        <div class="card">
          <div class="card-header bg-primary text-white">
            Department
          </div>
          <div class="card-body">
            <ul class="list-group">
              <li class="list-group-item">
                <a href="#" class="text-decoration-none">Department Admin Login</a>
              </li>
              <li class="list-group-item">
                <a href="#" class="text-decoration-none">Employee Login</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-md-8">
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <div class="card-header bg-success text-white">
                Announcements
              </div>
              <div class="card-body">
                <ul class="list-group">
                  <li class="list-group-item">Announcement 1</li>
                  <li class="list-group-item">Announcement 2</li>
                  <li class="list-group-item">Announcement 3</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header bg-warning text-white">
                Notifications
              </div>
              <div class="card-body">
                <ul class="list-group">
                  <li class="list-group-item">Notification 1</li>
                  <li class="list-group-item">Notification 2</li>
                  <li class="list-group-item">Notification 3</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <footer class="bg-light py-3 mt-4">
    <div class="row">
      <div class="col-md-12 text-center">
        <p>&copy; 2023 Company Name. All rights reserved.</p>
        <p>Services:</p>
        <div class="row">
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="Plumbing Services" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Plumbing Services</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Pipe installation and repair</li>
                  <li class="list-group-item">Leak detection and repair</li>
                  <li class="list-group-item">Drain cleaning</li>
                  <li class="list-group-item">Water heater installation and repair</li>
                  <li class="list-group-item">Sewer line repair and replacement</li>
                  <li class="list-group-item">Bathroom and kitchen plumbing</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="Electrical Services" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Electrical Services</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Electrical wiring and rewiring</li>
                  <li class="list-group-item">Circuit breaker installation and repair</li>
                  <li class="list-group-item">Lighting installation and repair</li>
                  <li class="list-group-item">Electrical panel upgrades</li>
                  <li class="list-group-item">Outlet and switch installation</li>
                  <li class="list-group-item">Emergency electrical services</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="Mechanical Services" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Mechanical Services</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">HVAC (Heating, Ventilation, and Air Conditioning) installation and repair</li>
                  <li class="list-group-item">Furnace and boiler maintenance</li>
                  <li class="list-group-item">Air conditioning unit installation and repair</li>
                  <li class="list-group-item">Duct cleaning and repair</li>
                  <li class="list-group-item">Thermostat installation and repair</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="General Handyman Services" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">General Handyman Services</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Furniture assembly</li>
                  <li class="list-group-item">Home repairs (doors, windows, drywall)</li>
                  <li class="list-group-item">Painting and touch-ups</li>
                  <li class="list-group-item">Fixture installation (shelves, cabinets)</li>
                  <li class="list-group-item">Minor carpentry work</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="Appliance Repair Services" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Appliance Repair Services</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Refrigerator repair</li>
                  <li class="list-group-item">Washing machine and dryer repair</li>
                  <li class="list-group-item">Dishwasher repair</li>
                  <li class="list-group-item">Oven and stove repair</li>
                  <li class="list-group-item">Microwave repair</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="Landscaping and Lawn Care" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Landscaping and Lawn Care</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Lawn mowing and maintenance</li>
                  <li class="list-group-item">Tree trimming and removal</li>
                  <li class="list-group-item">Garden planting and maintenance</li>
                  <li class="list-group-item">Irrigation system installation and repair</li>
                  <li class="list-group-item">Landscape design</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="Cleaning Services" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Cleaning Services</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Residential cleaning</li>
                  <li class="list-group-item">Commercial cleaning</li>
                  <li class="list-group-item">Carpet cleaning</li>
                  <li class="list-group-item">Window cleaning</li>
                  <li class="list-group-item">Post-construction cleaning</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="Pest Control Services" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Pest Control Services</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Termite control</li>
                  <li class="list-group-item">Rodent control</li>
                  <li class="list-group-item">Insect extermination</li>
                  <li class="list-group-item">Bed bug treatment</li>
                  <li class="list-group-item">Wildlife removal</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="Roofing Services" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Roofing Services</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Roof installation and replacement</li>
                  <li class="list-group-item">Roof repair and maintenance</li>
                  <li class="list-group-item">Gutter installation and cleaning</li>
                  <li class="list-group-item">Skylight installation and repair</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 mb-3">
            <div class="card">
              <img src="https://placehold.co/200x100" alt="Security System Installation" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Security System Installation</h5>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">CCTV installation</li>
                  <li class="list-group-item">Alarm system installation</li>
                  <li class="list-group-item">Access control systems</li>
                  <li class="list-group-item">Home automation systems</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
</div>
</body>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
 
  <script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>

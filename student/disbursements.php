<?php
session_start();
require_once '../includes/db.php';

if(!isset($_SESSION['student_id'])) {
    header("Location: ../student_login.php");
    exit();
}

$student_id = $_SESSION['student_id'];

$disb = $pdo->prepare("SELECT * FROM disbursements WHERE scholar_id = ? ORDER BY created_at DESC");
$disb->execute([$student_id]);
$disbursements = $disb->fetchAll();

$total = array_sum(array_column(array_filter($disbursements, fn($d) => $d['status'] == 'released'), 'amount'));
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disbursements | Cainta Scholarship</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f0f4f8; }
        .topnav {
            background: #1A3A6B; padding: 12px 24px;
            display: flex; justify-content: space-between; align-items: center;
            position: relative;
        }
        .topnav-brand { color: white; font-size: 16px; font-weight: 600; text-decoration: none; }
        .topnav-links a { color: rgba(255,255,255,0.8); text-decoration: none; font-size: 14px; margin-left: 20px; }
        .topnav-links a:hover { color: white; }
        .topnav-links a.active { color: white; font-weight: 500; }
        .main-content { padding: 24px; max-width: 900px; margin: 0 auto; }
        .card { border: none; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); }
        .total-card {
            background: linear-gradient(135deg, #1A3A6B, #2E75B6);
            color: white; border-radius: 12px; padding: 24px; margin-bottom: 24px;
        }

        /* Mobile nav */
        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            color: white;
            font-size: 22px;
            cursor: pointer;
        }
        .mobile-dropdown {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: #1A3A6B;
            z-index: 999;
            padding: 8px 0;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .mobile-dropdown.show { display: block; }
        .mobile-dropdown a {
            display: block;
            padding: 12px 24px;
            color: rgba(255,255,255,0.85);
            text-decoration: none;
            font-size: 14px;
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }
        .mobile-dropdown a:hover { background: rgba(255,255,255,0.1); color: white; }
        .mobile-dropdown a.active { color: white; font-weight: 600; }

        @media (max-width: 768px) {
            .topnav-links { display: none !important; }
            .mobile-menu-btn { display: block; }
            .main-content { margin-left: 0 !important; padding: 16px !important; max-width: 100% !important; }
            .table-responsive { font-size: 13px; }
        }
    </style>
</head>
<body>
<div class="topnav">
    <a href="dashboard.php" class="topnav-brand">
        <i class="bi bi-mortarboard-fill me-2"></i>Cainta Scholarship Portal
    </a>
    <div class="topnav-links">
        <a href="dashboard.php">Home</a>
        <a href="application.php">My Application</a>
        <a href="status.php">Status</a>
        <a href="disbursements.php" class="active">Disbursements</a>
        <a href="../student_logout.php">Logout</a>
    </div>
    <!-- Mobile hamburger -->
    <button class="mobile-menu-btn" onclick="toggleMobileMenu()">
        <i class="bi bi-list" id="mobile-nav-icon"></i>
    </button>
    <!-- Mobile dropdown -->
    <div class="mobile-dropdown" id="mobileDropdown">
        <a href="dashboard.php"><i class="bi bi-house me-2"></i>Home</a>
        <a href="application.php"><i class="bi bi-file-earmark me-2"></i>My Application</a>
        <a href="status.php"><i class="bi bi-clock me-2"></i>Status</a>
        <a href="disbursements.php" class="active"><i class="bi bi-cash me-2"></i>Disbursements</a>
        <a href="../student_logout.php" style="color:#ff8080;"><i class="bi bi-box-arrow-left me-2"></i>Logout</a>
    </div>
</div>

<div class="main-content">
    <div class="mb-4">
        <h5 class="mb-0 fw-bold">My Disbursements</h5>
        <small class="text-muted">View your allowance release history</small>
    </div>

    <!-- Total Card -->
    <div class="total-card">
        <div style="font-size:13px; opacity:0.8;">Total Allowance Received</div>
        <div style="font-size:36px; font-weight:700;">₱<?= number_format($total, 2) ?></div>
        <div style="font-size:13px; opacity:0.7;"><?= count($disbursements) ?> disbursement(s) on record</div>
    </div>

    <!-- Disbursements Table -->
    <div class="card">
        <div class="card-body">
            <?php if(empty($disbursements)): ?>
            <div class="text-center py-5">
                <i class="bi bi-cash-stack fs-3 text-muted d-block mb-3"></i>
                <p class="text-muted">No disbursements yet.</p>
                <small class="text-muted">Allowances will appear here once released by the cashier.</small>
            </div>
            <?php else: ?>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>School Year</th>
                            <th>Semester</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Released Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($disbursements as $i => $d): ?>
                        <tr>
                            <td><?= $i + 1 ?></td>
                            <td><?= $d['school_year'] ?></td>
                            <td><?= $d['semester'] ?> Semester</td>
                            <td><strong>₱<?= number_format($d['amount'], 2) ?></strong></td>
                            <td>
                                <span class="badge <?= $d['status']=='released' ? 'bg-success' : 'bg-warning text-dark' ?>">
                                    <?= ucfirst($d['status']) ?>
                                </span>
                            </td>
                            <td>
                                <?= $d['released_at'] ? date('F d, Y', strtotime($d['released_at'])) : '—' ?>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <?php endif; ?>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<?php include '../chatbot_widget.php'; ?>

<script>
function toggleMobileMenu() {
    var dropdown = document.getElementById('mobileDropdown');
    var icon = document.getElementById('mobile-nav-icon');
    if (dropdown.classList.contains('show')) {
        dropdown.classList.remove('show');
        icon.className = 'bi bi-list';
    } else {
        dropdown.classList.add('show');
        icon.className = 'bi bi-x';
    }
}
document.addEventListener('click', function(e) {
    var dropdown = document.getElementById('mobileDropdown');
    var btn = document.querySelector('.mobile-menu-btn');
    if (dropdown && btn && !dropdown.contains(e.target) && !btn.contains(e.target)) {
        dropdown.classList.remove('show');
        var icon = document.getElementById('mobile-nav-icon');
        if(icon) icon.className = 'bi bi-list';
    }
});
</script>
</body>
</html>
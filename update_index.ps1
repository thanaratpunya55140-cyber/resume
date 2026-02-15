$file = "d:\Resume\index.html"
$lines = Get-Content $file -Encoding UTF8
$start = 986 # Line 987 (0-based index)
$end = 1042 # Line 1043

$newContent = @"
      <div class="lab-infographic-container">
        
        <!-- Introduction -->
        <p class="academic-text" style="text-align: center; max-width: 800px; margin: 0 auto 3rem;">
          การศึกษาและวิเคราะห์สมบัติทางความร้อนของเชื้อเพลิงชีวมวลจากเปลือกข้าว (Rice Husk) 
          ด้วยเครื่อง Bomb Calorimeter เพื่อประเมินศักยภาพในการเป็นพลังงานทดแทนที่ยั่งยืน 
          โดยมุ่งเน้นการศึกษาผลกระทบของความชื้นและปริมาณเถ้าที่มีต่อค่าความร้อนสุทธิ
        </p>

        <div class="infographic-grid">
          
          <!-- Card 1: Physical Properties -->
          <div class="info-card">
            <div class="card-header">
              <i class="fa-solid fa-flask-vial"></i>
              <h4>คุณสมบัติทางกายภาพ</h4>
            </div>
            <div class="property-grid">
              <div class="prop-item">
                <span class="prop-value">9-12%</span>
                <span class="prop-label">ความชื้น (Moisture)</span>
              </div>
              <div class="prop-item">
                <span class="prop-value">15-20%</span>
                <span class="prop-label">ปริมาณเถ้า (Ash)</span>
              </div>
              <div class="prop-item" style="grid-column: 1 / -1;">
                <span class="prop-value">90-150</span>
                <span class="prop-label">ความหนาแน่น (kg/m³)</span>
              </div>
            </div>
          </div>

          <!-- Card 2: Calorific Comparison -->
          <div class="info-card">
            <div class="card-header">
              <i class="fa-solid fa-chart-simple"></i>
              <h4>ค่าความร้อน (Calorific Value)</h4>
            </div>
            <div class="chart-container">
              
              <!-- Coal -->
              <div class="chart-row">
                <div class="chart-label">ถ่านหิน</div>
                <div class="chart-bar-bg">
                  <div class="chart-bar bar-coal" style="width: 95%;">6,000+ kcal</div>
                </div>
              </div>

              <!-- Rice Husk (Optimal) -->
              <div class="chart-row">
                <div class="chart-label"><strong>เปลือกข้าว</strong></div>
                <div class="chart-bar-bg">
                  <div class="chart-bar bar-rice" style="width: 60%;">3,600 kcal</div>
                </div>
              </div>

              <!-- Wood -->
              <div class="chart-row">
                <div class="chart-label">ไม้ฟืน</div>
                <div class="chart-bar-bg">
                  <div class="chart-bar bar-wood" style="width: 50%;">3,000 kcal</div>
                </div>
              </div>

            </div>
            <p style="font-size: 0.85rem; margin-top: 1rem; color: #666; text-align: center;">
              *ค่าความร้อนเฉลี่ย ณ ความชื้นมาตรฐาน
            </p>
          </div>

          <!-- Card 3: Key Finding -->
          <div class="info-card key-finding-box">
            <div class="finding-icon">
              <i class="fa-solid fa-lightbulb"></i>
            </div>
            <div class="finding-content">
              <h4>ผลการวิเคราะห์สำคัญ</h4>
              <p class="academic-text" style="font-size: 0.95rem;">
                จากการทดลองพบว่า <strong>"ความชื้น"</strong> เป็นปัจจัยวิกฤตที่ส่งผลต่อค่าความร้อน 
                โดยเปลือกข้าวที่มีความชื้นต่ำ (4%) ให้ค่าความร้อนสูงถึง <strong>9,011 Btu/lb</strong> 
                ในขณะที่ความชื้นสูง (15%) ค่าความร้อนลดลงเหลือเพียง 2,652 Btu/lb
              </p>
            </div>
          </div>

        </div>

        <!-- Download Action -->
        <div style="text-align: center;">
          <a href="images/รายงานปฏิบัติการทดลอง เรื่อง การหาค่าความร้อนของเปลือกข้าว (2).pdf" target="_blank" class="lab-download-btn">
            <i class="fa-solid fa-file-pdf"></i> ดาวน์โหลดรายงานฉบับเต็ม (PDF)
          </a>
        </div>

      </div>
"@

$finalContent = $lines[0..($start-1)] + $newContent + $lines[($end+1)..($lines.Count-1)]
$finalContent | Set-Content $file -Encoding UTF8
Write-Host "File updated successfully."

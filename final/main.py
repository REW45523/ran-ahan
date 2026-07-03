# ==========================================
# Section 2.2 Python Logic
# ==========================================

# 1. ตรรกะตรวจสอบและหักเงิน Wallet
def process_payment(wallet_balance, item_price):
    # เงื่อนไข Wallet Balance ต้องมีค่ามากกว่าหรือเท่ากับราคาสินค้า
    if wallet_balance >= item_price:
        new_balance = wallet_balance - item_price
        print(f"ชำระเงินสำเร็จ! ยอดเงินคงเหลือใหม่: {new_balance} บาท")
        return new_balance
    else:
        print("Error: ยอดเงินใน Wallet ไม่เพียงพอสำหรับการชำระเงิน")
        return wallet_balance

# 2. ตรรกะการวนลูปดึงข้อมูลคิวแสดงบนหน้าจอ Terminal
def display_active_queues(queue_list):
    print("\n--- รายการคิวที่กำลังรอ (Pending) ---")
    # วนลูปเพื่อคัดกรองเฉพาะคิวสั่งซื้อที่มี Status เป็น 'Pending'
    for queue in queue_list:
        if queue['status'] == 'Pending':
            print(f"คิวที่: {queue['queue_id']} | เมนู: {queue['menu']} | สถานะ: {queue['status']}")

# --- ตัวอย่างการเรียกใช้งานเพื่อทดสอบระบบ (เดโมการทำงาน) ---
if __name__ == "__main__":
    print("=== ทดสอบระบบ Wallet ===")
    user_wallet = 100.00
    # รอบที่ 1: เงินพอ
    user_wallet = process_payment(user_wallet, 55.00)
    # รอบที่ 2: เงินไม่พอ
    user_wallet = process_payment(user_wallet, 60.00)
    
    print("\n=== ทดสอบระบบแสดงคิว ===")
    # จำลอง List ของคิวทั้งหมด
    mock_queues = [
        {'queue_id': 1, 'menu': 'ข้าวกะเพราไก่ไข่ดาว', 'status': 'Pending'},
        {'queue_id': 2, 'menu': 'ข้าวผัดหมู', 'status': 'Pending'},
        {'queue_id': 3, 'menu': 'ก๋วยเตี๋ยวเส้นเล็กต้มยำ', 'status': 'Ready'}
    ]
    display_active_queues(mock_queues)

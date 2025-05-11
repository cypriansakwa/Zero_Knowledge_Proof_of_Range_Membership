# Zero-Knowledge Proof of Range Membership

This Noir project demonstrates how to prove that a secret value lies within a specific integer range using zero-knowledge proofs.

## 🔒 Goal

Prove in zero-knowledge that a secret number `x` lies within the range `[10, 100]`, without revealing `x`.

---

## 📄 Source Code

### `src/main.nr`

```rust
fn main(x: pub u32) {
    let lower_bound: u32 = 10;
    let upper_bound: u32 = 100;

    assert(x >= lower_bound);
    assert(x <= upper_bound);
}

#[test]
fn test_valid_range() {
    main(42); // Passes
}

//#[test]
//fn test_out_of_range() {
//    main(150); // Fails
//}
```
# ⚙️ Setup Instructions

## 1. Install Noir

Follow the official Noir install guide:  
👉 [https://noir-lang.org/getting-started/installation](https://noir-lang.org/getting-started/installation)

---

## 2. Compile the Circuit

```bash
nargo compile
```
This generates the proving and verification artifacts in the `target` directory.
## 3. Create the Input File
Create a `proof.toml` file in the root of your project:
```toml
x = 42
```
Make sure the value of x is within the valid range $\[10, 100\]$.
4. **Generate the Proof**  
Run: `nargo prove`  
This creates the `proof.json` and `proof_public.json` files.  

5. **Verify the Proof**  
Run: `nargo verify`  
Expected output:  
`Proof verification successful`  

# 🧪 Testing
Run the tests with: `nargo test`  
Expected output:  
`Testing test_valid_range ... ok`  
You can uncomment the `test_out_of_range` function to confirm that values outside the range fail the constraint system.  

# 🧠 Notes
- Noir does not allow comparison operators like `>=` or `<=` on `Field` elements.  
- Use `u32`, `u64`, etc., for range checks that require ordering.  

# 📁 File Structure
Zero_Knowledge_Proof_of_Range_Membership/  
├── src/  
│   └── main.nr  
├── proof.toml  
├── target/  
├── Nargo.toml  
└── README.md  

# 🔐 Why This Matters
This kind of constraint is fundamental in many ZK applications like:  
- Verifying age ≥ 18 without revealing the actual age  
- Ensuring bids or values are within allowed bounds in private auctions  
- Range proofs in confidential transactions  

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
  //  main(150); // Fails
//}

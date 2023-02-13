module hello_aptos::wasabi {

    const MODULE_ADMIN: address = @hello_aptos;

    struct Wasabi has key {
        value: u64,
    }

    entry fun create_wasabi(admin: &signer)
    {
        let wasabi = Wasabi { value: 0 };
        move_to<Wasabi>(admin, wasabi);
    }

    entry fun push_wasabi(value: u64)
    acquires Wasabi
    {
        let wasabi = borrow_global_mut<Wasabi>(MODULE_ADMIN);
        wasabi.value = value;
    }

}
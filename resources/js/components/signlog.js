
let signlog = {

    loginform: () => (<div className="w-full bg-white rounded-lg shadow-md border">
        <div className="p-2">
            <h1 className="text-lg font-bold">
                Log in to your account
            </h1>

            <div>
                <label htmlFor="email" className="block mb-1 text-sm font-medium">Your email</label>
                <input type="email" name="email" id="email" className="bg-gray-50 border w-full box-border p-1 rounded-md" placeholder="name@company.com" required="" />
            </div>
            <div>
                <label htmlFor="password" className="block mb-1 text-sm font-medium">Password</label>
                <input type="password" name="password" id="password" placeholder="••••••••" className="bg-gray-50 border w-full box-border p-1 rounded-md" required="" />
            </div>

            <button className="bg-gray-50 border w-full box-border p-1 rounded-md mt-4">Login</button>
        </div>
    </div>),

    signupform: () => (<div className="w-full bg-white rounded-lg shadow-md border">
        <div className="p-2">
            <h1 className="text-lg font-bold">
                Create and account
            </h1>

            <div>
                <label htmlFor="full-name" className="block mb-1 text-sm font-medium">Full Name</label>
                <input type="confirm-password" name="confirm-password" id="full-name" placeholder="John Doe" className="bg-gray-50 border w-full box-border p-1 rounded-md" required="" />
            </div>

            <div>
                <label htmlFor="email" className="block mb-1 text-sm font-medium">Your email</label>
                <input type="email" name="email" id="email" className="bg-gray-50 border w-full box-border p-1 rounded-md" placeholder="johndoe@domain.com" required="" />
            </div>
            <div>
                <label htmlFor="password" className="block mb-1 text-sm font-medium">Password</label>
                <input type="password" name="password" id="password" placeholder="••••••••" className="bg-gray-50 border w-full box-border p-1 rounded-md" required="" />
            </div>

            <button className="bg-gray-50 border w-full box-border p-1 rounded-md mt-4">Create an account</button>
        </div>
    </div>)

};

export default signlog;
module.exports = {
    apps: [
        {
            name: "newyearlp-web",
            script: "npm",
            args: "start",
            env: {
                NODE_ENV: "production",
                PORT: 3056
            }
        },
        {
            name: "newyearlp-worker",
            script: "npm",
            args: "run worker",
            env: {
                NODE_ENV: "production"
            }
        }
    ]
};

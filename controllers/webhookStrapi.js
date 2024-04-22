const { exec } = require('child_process');

// Функция для запуска bash скрипта
const webhookStrapi = () => {
    exec('./deploy.sh', (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
    });
}

module.exports = { webhookStrapi };

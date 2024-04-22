const { exec } = require('child_process');

// Функция для запуска bash скрипта
const webhookStrapi = () => {
    exec('./config/webhookStrapi.sh', (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
    });
}

module.exports = { webhookStrapi };

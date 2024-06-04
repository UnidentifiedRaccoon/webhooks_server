const {exec} = require('child_process');

// Функция для запуска bash скрипта
const webhookWebsite = () => {
    exec('./config/webhookWebsite.sh', (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
        console.error(`stderr: ${stderr}`);
    });
}

module.exports = {webhookWebsite};

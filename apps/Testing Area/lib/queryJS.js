
function waitAndReturn() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('Completed after 5 seconds');
    }, 5000);
  });
}

return waitAndReturn().then(result => result);


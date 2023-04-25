export const LoadingModal = () => {
    return (
      <div
        style={{
          position: 'fixed',
          top: 0,
          left: 0,
          width: '100%',
          height: '100%',
          backgroundColor: 'rgba(0, 0, 0, 0.5)',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          zIndex: 9999,
        }}
      >
        <div
          style={{
            backgroundColor: '#fff',
            padding: '20px',
            borderRadius: '5px',
            fontSize: '24px',
          }}
        >
          Loading...
        </div>
      </div>
    );
  };